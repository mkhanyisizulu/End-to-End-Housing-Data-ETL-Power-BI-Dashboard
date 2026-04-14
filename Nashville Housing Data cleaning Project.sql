-- NashVille Housing Data Cleaning Project

-- Project Breakdown

SELECT *
INTO NashvilleHousing_Clean
FROM portproject2.dbo.NashvilleHousing;

Select *
From NashvilleHousing_Clean;

-- 1.Standardise date format

Select SaleDateConverted, CONVERT(Date,SaleDate)
From NashvilleHousing_Clean;

UPDATE NashvilleHousing_Clean
SET SaleDate = CONVERT(Date,SaleDate);

ALTER TABLE NashvilleHousing_Clean
ADD SaleDateConverted Date;

UPDATE NashvilleHousing_Clean 
SET SaleDateConverted = CONVERT(Date,SaleDate);



---------------------------------------------------------------------------------------

-- 2.Populate property address data

Select *
From NashvilleHousing_Clean
ORDER BY ParcelID;


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From NashvilleHousing_Clean a
JOIN NashvilleHousing_Clean b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress IS NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From NashvilleHousing_Clean a
JOIN NashvilleHousing_Clean b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress IS NULL



---------------------------------------------------------------------------------------

-- 3.Break out Address into individual columns( address, city, state)


Select PropertyAddress
From NashvilleHousing_Clean;

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) AS Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(propertyaddress)) AS Address
From NashvilleHousing_Clean;


ALTER TABLE NashvilleHousing_Clean
ADD PropertySplitAddress Nvarchar(255);

UPDATE NashvilleHousing_Clean 
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 );



ALTER TABLE NashvilleHousing_Clean
ADD PropertySplitCity Nvarchar(255);

UPDATE NashvilleHousing_Clean 
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(propertyaddress));

Select *
From NashvilleHousing_Clean;



Select OwnerAddress
From NashvilleHousing_Clean;

Select
PARSENAME(REPLACE(OwnerAddress,',','.'), 3)
, PARSENAME(REPLACE(OwnerAddress,',','.'), 2)
, PARSENAME(REPLACE(OwnerAddress,',','.'), 1)
From NashvilleHousing_Clean;


ALTER TABLE NashvilleHousing_Clean
ADD OwnerSplitAddress Nvarchar(255);

UPDATE NashvilleHousing_Clean 
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'), 3);

--


ALTER TABLE NashvilleHousing_Clean
ADD OwnerSplitCity Nvarchar(255);

UPDATE NashvilleHousing_Clean 
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'), 2);

--


ALTER TABLE NashvilleHousing_Clean
ADD OwnerSplitState Nvarchar(255);

UPDATE NashvilleHousing_Clean 
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'), 1);



Select *
From NashvilleHousing_Clean;


----------------------------------------------------------------------------------------

-- 4. Change Y and N to YES and NO in "Sold as vacant" field

Select DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
From NashvilleHousing_Clean
Group by SoldAsVacant
Order by 2;


Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From NashvilleHousing_Clean




UPDATE NashvilleHousing_Clean
SET SoldAsVacant = CASE 
	   When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END


---------------------------------------------------------------------------------------

-- 5. Checking for Duplicates


WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
				 UniqueID
				 ) AS row_num
From NashvilleHousing_Clean
)
select COUNT(*) AS DuplicateCount
From RowNumCTE
Where row_num > 1;

Select *
From NashvilleHousing_Clean


---------------------------------------------------------------------------------------

-- 6.Delete Unused columns


Select *
From NashvilleHousing_Clean

ALTER TABLE NashvilleHousing_Clean
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress;


ALTER TABLE NashvilleHousing_Clean
DROP COLUMN SaleDate;

----------------------------------------------------------------------------------------
-- Final Validation Checks

-- Total rows
SELECT COUNT(*) AS TotalRows FROM NashvilleHousing_Clean;

-- Check for null addresses
SELECT COUNT(*) AS MissingAddresses
FROM NashvilleHousing_Clean
WHERE PropertySplitAddress IS NULL;

-- Check distinct values in SoldAsVacant
SELECT DISTINCT SoldAsVacant
FROM NashvilleHousing_Clean;
----------------------------------------------------------------------------------------



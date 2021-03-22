/*
  Warnings:

  - You are about to drop the column `updatedAt` on the `Price` table. All the data in the column will be lost.
  - Changed the type of `fuelType` on the `Price` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `schedule` to the `Station` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "FuelType" AS ENUM ('BIODSL', 'BIOETL', 'GNC', 'GNL', 'GLP', 'DSLA', 'DSLB', 'DSLPRE', 'G95E10', 'G95E5', 'G95E5PRE', 'G98E10', 'G98E5', 'HDG');

-- AlterTable
ALTER TABLE "Price" DROP COLUMN "updatedAt",
DROP COLUMN "fuelType",
ADD COLUMN     "fuelType" "FuelType" NOT NULL,
ALTER COLUMN "createdAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Station" ADD COLUMN     "schedule" TEXT NOT NULL;

/*
  Warnings:

  - You are about to drop the column `parkingId` on the `vehicles` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_vehicles" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "license" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "entryTime" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "exitTime" DATETIME
);
INSERT INTO "new_vehicles" ("color", "entryTime", "exitTime", "id", "license", "model") SELECT "color", "entryTime", "exitTime", "id", "license", "model" FROM "vehicles";
DROP TABLE "vehicles";
ALTER TABLE "new_vehicles" RENAME TO "vehicles";
CREATE UNIQUE INDEX "vehicles_license_key" ON "vehicles"("license");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

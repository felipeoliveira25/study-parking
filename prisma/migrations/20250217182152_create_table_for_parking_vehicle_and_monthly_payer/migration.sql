-- CreateTable
CREATE TABLE "parking" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "totalSpots" INTEGER NOT NULL,
    "occupiedSpots" INTEGER NOT NULL DEFAULT 0,
    "availableSpots" INTEGER NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "vehicles" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "license" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "entryTime" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "exitTime" DATETIME,
    "parkingId" TEXT NOT NULL,
    CONSTRAINT "vehicles_parkingId_fkey" FOREIGN KEY ("parkingId") REFERENCES "parking" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "monthlyPayers" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "license" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "numero" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_license_key" ON "vehicles"("license");

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_parkingId_key" ON "vehicles"("parkingId");

-- CreateIndex
CREATE UNIQUE INDEX "monthlyPayers_license_key" ON "monthlyPayers"("license");

-- CreateIndex
CREATE UNIQUE INDEX "monthlyPayers_cpf_key" ON "monthlyPayers"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "monthlyPayers_numero_key" ON "monthlyPayers"("numero");

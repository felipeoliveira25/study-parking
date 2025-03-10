import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient({
    log: ['query'] //see all queries in terminal
});
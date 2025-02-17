import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient({
    log: ['query'] //comunica ao prisma que desejamos ver pelo terminal todas as queries que ele fizer no banco de dados 
});
import { prisma } from "@/lib/prisma"
import { NextResponse } from "next/server";

export async function GET() {
    try {
        const allVehicle = await prisma.vehicle.findMany()
        return NextResponse.json(allVehicle, { status: 200})
    } catch (error) {
        console.log(error)
    }
    
}

export async function POST(req: Request) {
    const bodyReq = await req.json()
    const { license, model, color, entryTime } = bodyReq;

    const vehicleFull = await prisma.vehicle.create({
        data: { license, model, color, entryTime
        }
    })

    return NextResponse.json(vehicleFull, { status: 201})
}
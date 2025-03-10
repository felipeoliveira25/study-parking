import { prisma } from "@/lib/prisma";
import { NextResponse } from "next/server";

/**
 * route for vehicle in API
 * @field GET => get all vehicles
 * @field POST => add new vehicle
 * @field DELETE => delete vehicle by your license
 * 
 */



export async function GET() {
    try {
        const allVehicle = await prisma.vehicle.findMany()
        return NextResponse.json(allVehicle, { status: 200})
    } catch (error) {
        console.log(error)
    }
    
}

export async function POST(req: Request) {
    try {
        const bodyReq = await req.json()
    const { license, model, color, entryTime } = bodyReq;

    const vehicleFull = await prisma.vehicle.create({
        data: { license, model, color, entryTime
        }
    })

    return NextResponse.json(vehicleFull, { status: 201})
    } catch (error) {
        console.log(error)
    }
    
}

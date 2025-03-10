import { prisma } from "@/lib/prisma";
import { NextResponse } from "next/server";


export async function DELETE(req: Request, {params}: { params: Promise<{ license: string}>}) {
  try {
    const { license } = await params;

    const deletedVehicle = await prisma.vehicle.delete({
      where: { license },
    });

    return NextResponse.json(
      { message: "Veículo deletado com sucesso", deletedVehicle },
      { status: 200 }
    );
  } catch {
    return NextResponse.json({ error: "Erro ao deletar veículo" }, { status: 500 });
  }
}

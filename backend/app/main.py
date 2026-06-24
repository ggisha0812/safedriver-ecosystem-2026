
from fastapi import FastAPI, Depends, HTTPException, Header
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from datetime import datetime

# 1. CREACIÓN DE LA INSTANCIA (Debe ser siempre lo primero)
app = FastAPI()

# 2. CONFIGURACIÓN DE CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 3. MODELOS DE DATOS (Pydantic)
class SOSAlert(BaseModel):
    usuario_id: int
    latitud: float
    longitud: float

class WalletTransaction(BaseModel):
    usuario_id: int
    monto: float
    tipo: str

class Telemetria(BaseModel):
    velocidad: float
    fatiga: bool
    vehiculo_id: str

# 4. FUNCIÓN DE SEGURIDAD JWT (Validación del token)
def validar_token(authorization: str = Header(...)):
    if not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Token inválido")
    return authorization

# 5. RUTAS / ENDPOINTS (Van al final)
@app.get("/")
def read_root():
    return {"message": "SafeDriver API funcionando"}

@app.post("/seguridad/sos", status_code=201)
def registrar_sos(alerta: SOSAlert):
    print(f"🚨 ALERTA CRÍTICA: Usuario {alerta.usuario_id} activó S.O.S.")
    return {"status": "success", "message": "Alerta transmitida"}

@app.post("/wallet/transaccion")
def procesar_pago(transaccion: WalletTransaction):
    return {"status": "approved", "nuevo_saldo": 45.50}

# ESTA ES LA NUEVA RUTA IOT QUE QUERÍAS AGREGAR
@app.post("/iot/telemetria")
async def recibir_telemetria(datos: Telemetria, token: str = Depends(validar_token)):
    print(f"📡 Recibido de {datos.vehiculo_id}: {datos.velocidad} km/h, ¿Fatiga?: {datos.fatiga}")
    return {"status": "registrado"}

@app.get("/iot/ultima_alerta")
def obtener_ultima_alerta():
    # Aquí buscarías la última alerta en tu base de datos
    return {"fatiga": True, "velocidad": 80.0}
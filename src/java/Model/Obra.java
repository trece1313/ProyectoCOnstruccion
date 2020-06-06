/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author trece
 */
public class Obra 
{
    private int id_Obra;
    private String fechaInicio_Obra;
    private String fechaFin_Obra;
    private double pagosAPagarObra;
    Estatus estatObra;
    Trabajador trabObra;
    DetalleServicioPresupuesto detSerPreObra;

    public Obra() 
    {
        this.id_Obra = 0;
        this.fechaInicio_Obra = "";
        this.fechaFin_Obra = "";
        this.pagosAPagarObra = 0;
        this.estatObra = new Estatus();
        this.trabObra = new Trabajador();
        this.detSerPreObra = new DetalleServicioPresupuesto();
    }

    
    
    public int getId_Obra() {
        return id_Obra;
    }

    public void setId_Obra(int id_Obra) {
        this.id_Obra = id_Obra;
    }

    public String getFechaInicio_Obra() {
        return fechaInicio_Obra;
    }

    public void setFechaInicio_Obra(String fechaInicio_Obra) {
        this.fechaInicio_Obra = fechaInicio_Obra;
    }

    public String getFechaFin_Obra() {
        return fechaFin_Obra;
    }

    public void setFechaFin_Obra(String fechaFin_Obra) {
        this.fechaFin_Obra = fechaFin_Obra;
    }

    public double getPagosAPagarObra() {
        return pagosAPagarObra;
    }

    public void setPagosAPagarObra(double pagosAPagarObra) {
        this.pagosAPagarObra = pagosAPagarObra;
    }

    public Estatus getEstatObra() {
        return estatObra;
    }

    public void setEstatObra(Estatus estatObra) {
        this.estatObra = estatObra;
    }

    public Trabajador getTrabObra() {
        return trabObra;
    }

    public void setTrabObra(Trabajador trabObra) {
        this.trabObra = trabObra;
    }

    public DetalleServicioPresupuesto getDetSerPreObra() {
        return detSerPreObra;
    }

    public void setDetSerPreObra(DetalleServicioPresupuesto detSerPreObra) {
        this.detSerPreObra = detSerPreObra;
    }
    
    
    
    
}

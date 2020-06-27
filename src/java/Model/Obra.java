/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author trece
 */
public class Obra 
{
    private int id_Obra;
    private double total_Obra;
    private String fechaInicio_Obra;
    private String fechaFin_Obra;
    private double pagoInicioObra;
    private double pagoFinalObra;
    private String fechaCotizacionObra;
    Estatus estatObra;
    Trabajador trabObra;
    ArrayList<DetalleServicioPresupuesto> detSerPreObra;
    Usuario usrObra;
    Cliente clienteObra;

    public Obra() 
    {
        this.id_Obra = 0;
        this.fechaInicio_Obra = "";
        this.fechaFin_Obra = "";
        this.pagoInicioObra = 0;
        this.total_Obra = 0;
        pagoFinalObra = 0;
        this.fechaCotizacionObra = "";
        this.estatObra = new Estatus();
        this.trabObra = new Trabajador();
        this.detSerPreObra = new ArrayList<>();
        usrObra = new Usuario();
        clienteObra = new Cliente();
        
    }

    public ArrayList<DetalleServicioPresupuesto> getDetSerPreObra() {
        return detSerPreObra;
    }

    public void setDetSerPreObra(ArrayList<DetalleServicioPresupuesto> detSerPreObra) {
        this.detSerPreObra = detSerPreObra;
    }

    public String getFechaCotizacionObra() {
        return fechaCotizacionObra;
    }

    public void setFechaCotizacionObra(String fechaCotizacionObra) {
        this.fechaCotizacionObra = fechaCotizacionObra;
    }

    public double getPagoFinalObra() {
        return pagoFinalObra;
    }

    public void setPagoFinalObra(double pagoFinalObra) {
        this.pagoFinalObra = pagoFinalObra;
    }

    public double getTotal_Obra() {
        return total_Obra;
    }

    public void setTotal_Obra(double total_Obra) {
        this.total_Obra = total_Obra;
    }

    public Usuario getUsrObra() {
        return usrObra;
    }

    public void setUsrObra(Usuario usrObra) {
        this.usrObra = usrObra;
    }

    public Cliente getClienteObra() {
        return clienteObra;
    }

    public void setClienteObra(Cliente clienteObra) {
        this.clienteObra = clienteObra;
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

    public double getPagoInicioObra() {
        return pagoInicioObra;
    }

    public void setPagoInicioObra(double pagosInicioObra) {
        this.pagoInicioObra = pagosInicioObra;
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

    
    
    
    
}

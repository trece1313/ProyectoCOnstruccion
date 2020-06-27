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
public class Presupuesto 
{
    private int id_Presupuesto;
    private double total_Presupuesto;
    private double precioPorMetro_Presupuesto;
    private String fecha_Presupuesto;
    Usuario usuPresupuesto;
    ArrayList<DetalleServicioPresupuesto>detalleServicio;

    public Presupuesto() 
    {
        this.id_Presupuesto = 0;
        this.total_Presupuesto = 0;
        this.precioPorMetro_Presupuesto = 0;
        this.fecha_Presupuesto = "";
        this.usuPresupuesto =  new Usuario();
        this.detalleServicio = new ArrayList<>();
        
    }

    public ArrayList<DetalleServicioPresupuesto> getDetalleServicio() {
        return detalleServicio;
    }

    public void setDetalleServicio(ArrayList<DetalleServicioPresupuesto> detalleServicio) {
        this.detalleServicio = detalleServicio;
    }
    
    
    

    public int getId_Presupuesto() {
        return id_Presupuesto;
    }

    public void setId_Presupuesto(int id_Presupuesto) {
        this.id_Presupuesto = id_Presupuesto;
    }

    public double getTotal_Presupuesto() {
        return total_Presupuesto;
    }

    public void setTotal_Presupuesto(double total_Presupuesto) {
        this.total_Presupuesto = total_Presupuesto;
    }

    public double getPrecioPorMetro_Presupuesto() {
        return precioPorMetro_Presupuesto;
    }

    public void setPrecioPorMetro_Presupuesto(double precioPorMetro_Presupuesto) {
        this.precioPorMetro_Presupuesto = precioPorMetro_Presupuesto;
    }

    public String getFecha_Presupuesto() {
        return fecha_Presupuesto;
    }

    public void setFecha_Presupuesto(String fecha_Presupuesto) {
        this.fecha_Presupuesto = fecha_Presupuesto;
    }

    public Usuario getUsuPresupuesto() {
        return usuPresupuesto;
    }

    public void setUsuPresupuesto(Usuario usuPresupuesto) {
        this.usuPresupuesto = usuPresupuesto;
    }
    
    
    
}

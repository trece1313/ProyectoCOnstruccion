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
public class Servicio 
{
    private int id_Servicio;
    private String nombre_Servicio;
    private String descipcion_Servicio;
    private double precioPorMetro;

    public Servicio() 
    {
        this.id_Servicio = 0;
        this.nombre_Servicio = "";
        this.descipcion_Servicio = "";
        this.precioPorMetro = 0;        
    }

    
        
    public int getId_Servicio() {
        return id_Servicio;
    }

    public void setId_Servicio(int id_Servicio) {
        this.id_Servicio = id_Servicio;
    }

    public String getNombre_Servicio() {
        return nombre_Servicio;
    }

    public void setNombre_Servicio(String nombre_Servicio) {
        this.nombre_Servicio = nombre_Servicio;
    }

    public String getDescipcion_Servicio() {
        return descipcion_Servicio;
    }

    public void setDescipcion_Servicio(String descipcion_Servicio) {
        this.descipcion_Servicio = descipcion_Servicio;
    }

    public double getPrecioPorMetro() {
        return precioPorMetro;
    }

    public void setPrecioPorMetro(double precioPorMetro) {
        this.precioPorMetro = precioPorMetro;
    }
    
    
    
}

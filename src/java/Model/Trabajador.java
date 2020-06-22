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
public class Trabajador 
{
    private int id_Trabajador;
    private String especialidad_Trabajador;
    private int diasTrabajoSemanaTrabajador;
    private int horasPorDiaTrabajadas;
    private double precioPorDiaTrabajado;
    Persona perTrabajador;
    
    

    public Trabajador()
    {
        this.id_Trabajador = 0;
        this.especialidad_Trabajador= "";
        this.diasTrabajoSemanaTrabajador = 0;
        this.horasPorDiaTrabajadas = 0;
        this.precioPorDiaTrabajado = 0;
        this.perTrabajador = new Persona();
        
    }

    public int getId_Trabajador() {
        return id_Trabajador;
    }

    public void setId_Trabajador(int id_Trabajador) {
        this.id_Trabajador = id_Trabajador;
    }

    public String getEspecialidad_Trabajador() {
        return especialidad_Trabajador;
    }

    public void setEspecialidad_Trabajador(String especialidad_Trabajador) {
        this.especialidad_Trabajador = especialidad_Trabajador;
    }

    public int getDiasTrabajoSemanaTrabajador() {
        return diasTrabajoSemanaTrabajador;
    }

    public void setDiasTrabajoSemanaTrabajador(int diasTrabajoSemanaTrabajador) {
        this.diasTrabajoSemanaTrabajador = diasTrabajoSemanaTrabajador;
    }

    public int getHorasPorDiaTrabajadas() {
        return horasPorDiaTrabajadas;
    }

    public void setHorasPorDiaTrabajadas(int horasPorDiaTrabajadas) {
        this.horasPorDiaTrabajadas = horasPorDiaTrabajadas;
    }

    public double getPrecioPorDiaTrabajado() {
        return precioPorDiaTrabajado;
    }

    public void setPrecioPorDiaTrabajado(double precioPorDiaTrabajado) {
        this.precioPorDiaTrabajado = precioPorDiaTrabajado;
    }

    public Persona getPerTrabajador() {
        return perTrabajador;
    }

    public void setPerTrabajador(Persona perTrabajador) {
        this.perTrabajador = perTrabajador;
    }
    
    
}
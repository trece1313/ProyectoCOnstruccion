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
    Persona perTrabajador = new Persona();
    Estatus statTrabajador = new Estatus();

    public int getId_Trabajador() {
        return id_Trabajador;
    }

    public void setId_Trabajador(int id_Trabajador) {
        this.id_Trabajador = id_Trabajador;
    }

    public Persona getPerTrabajador() {
        return perTrabajador;
    }

    public void setPerTrabajador(Persona perTrabajador) {
        this.perTrabajador = perTrabajador;
    }

    public Estatus getStatTrabajador() {
        return statTrabajador;
    }

    public void setStatTrabajador(Estatus statTrabajador) {
        this.statTrabajador = statTrabajador;
    }
    
    
    
}

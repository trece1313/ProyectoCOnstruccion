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
public class Estatus 
{
    private int id_Estatus;
    NombreEstatus nombreEstatus;

    public Estatus() 
    {
        this.id_Estatus = 0;
        this.nombreEstatus = new NombreEstatus();
    }

    
    
    public int getId_Estatus() {
        return id_Estatus;
    }

    public void setId_Estatus(int id_Estatus) {
        this.id_Estatus = id_Estatus;
    }

    public NombreEstatus getNombreEstatus() {
        return nombreEstatus;
    }

    public void setNombreEstatus(NombreEstatus nombreEstatus) {
        this.nombreEstatus = nombreEstatus;
    }
    
    
}

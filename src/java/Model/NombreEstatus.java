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
public class NombreEstatus 
{
    private int id_NombreEstatus;
    private String nombreEstatus;

    public NombreEstatus() 
    {
        this.id_NombreEstatus = 0;
        this.nombreEstatus = "";
        
    }

    
    
    public int getId_NombreEstatus() {
        return id_NombreEstatus;
    }

    public void setId_NombreEstatus(int id_NombreEstatus) {
        this.id_NombreEstatus = id_NombreEstatus;
    }

    public String getNombreEstatus() {
        return nombreEstatus;
    }

    public void setNombreEstatus(String nombreEstatus) {
        this.nombreEstatus = nombreEstatus;
    }
    
    
    
}

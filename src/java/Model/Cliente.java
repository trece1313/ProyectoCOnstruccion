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
public class Cliente 
{
    private int id_Cliente;
    Persona personaCliente;

    public Cliente() {
        this.id_Cliente = 0;
        this.personaCliente = new Persona();
    }

    
    
    public int getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(int id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public Persona getPersonaCliente() {
        return personaCliente;
    }

    public void setPersonaCliente(Persona personaCliente) {
        this.personaCliente = personaCliente;
    }
    
    
    
}

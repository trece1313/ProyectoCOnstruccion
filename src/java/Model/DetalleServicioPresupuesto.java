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
public class DetalleServicioPresupuesto 
{
    private int id_DetalleServicioPresupuesto;
    private double metrosCuadradoDetalle;
    private double subtotalDetalle;
    Presupuesto presupuestoDetalle;
    Servicio servicioDetalle;   
    Cliente clienteDetalle;
    Estatus estatusDetalle;

    public DetalleServicioPresupuesto() 
    {
        this.id_DetalleServicioPresupuesto = 0;
        this.metrosCuadradoDetalle = 0;
        this.subtotalDetalle = 0;
        this.presupuestoDetalle = new Presupuesto();
        this.servicioDetalle = new Servicio();
  
    }

    
    public int getId_DetalleServicioPresupuesto() {
        return id_DetalleServicioPresupuesto;
    }

    public void setId_DetalleServicioPresupuesto(int id_DetalleServicioPresupuesto) {
        this.id_DetalleServicioPresupuesto = id_DetalleServicioPresupuesto;
    }

    public double getMetrosCuadradoDetalle() {
        return metrosCuadradoDetalle;
    }

    public void setMetrosCuadradoDetalle(double metrosCuadradoDetalle) {
        this.metrosCuadradoDetalle = metrosCuadradoDetalle;
    }

    public double getSubtotalDetalle() {
        return subtotalDetalle;
    }

    public void setSubtotalDetalle(double subtotalDetalle) {
        this.subtotalDetalle = subtotalDetalle;
    }

    public Presupuesto getPresupuestoDetalle() {
        return presupuestoDetalle;
    }

    public void setPresupuestoDetalle(Presupuesto presupuestoDetalle) {
        this.presupuestoDetalle = presupuestoDetalle;
    }

    public Servicio getServicioDetalle() {
        return servicioDetalle;
    }

    public void setServicioDetalle(Servicio servicioDetalle) {
        this.servicioDetalle = servicioDetalle;
    }

    public Cliente getClienteDetalle() {
        return clienteDetalle;
    }

    public void setClienteDetalle(Cliente clienteDetalle) {
        this.clienteDetalle = clienteDetalle;
    }

    public Estatus getEstatusDetalle() {
        return estatusDetalle;
    }

    public void setEstatusDetalle(Estatus estatusDetalle) {
        this.estatusDetalle = estatusDetalle;
    }
    
}

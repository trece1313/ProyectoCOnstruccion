/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Model.DetalleServicioPresupuesto;
import Model.Obra;


/**
 *
 * @author trece
 */
public interface PresupuestoDAO extends CRUD<Obra>
{
    public Obra agregarPresupuesto(Obra obra, DetalleServicioPresupuesto dt);
}

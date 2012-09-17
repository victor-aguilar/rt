<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Estadisticas
 *
 * @author victor Aguilar
 */
class Estadisticas {
	
	private $db;
	
	function __construct($db){
		$this->db = $db;
	}
	public function cuantosTemasHay(){
		$query = sprintf('select count(*) as cuantos from Temas;');
		$result = $this->db->query($query);
		$row = $result->fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantasTutoriasHay(){
		$query = sprintf('select count(*) as cuantos from tutorias;');
		$result = $this->db->query($query);
		$row = $result->fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantosUsuariosHay(){
		$query = sprintf('select count(*) as cuantos from Usuarios');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantosHombresHay(){
		$query = sprintf('select count(*) as cuantos from Usuarios where sexo = "hombre" group by sexo;');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantasMujeresHay(){
		$query = sprintf('select count(*) as cuantos from Usuarios where sexo = "mujer" group by sexo;');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos']+1; //maquina
	}
	
	public function cuantosTutoresHay(){
		$query = sprintf("select count(distinct idUsuario) as cuantos from Temas where autorizado=1;");
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantosTutoradosHay(){
		$query = sprintf("select count(distinct estudiante) as cuantos from Tutorias ;");
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantasTutoriasEnDemostracionHay(){
		$query = sprintf('select
			count(*) as cuantos
			from
			((select
			idTutoria, max(idEtapa) as max
			from
			historial
			group by
			idTutoria) as t)
			where max = 5;');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantasTutoriasFinalizadasHay(){
		$query = sprintf('select
			count(*) as cuantos
			from
			((select
			idTutoria, max(idEtapa) as max
			from
			historial
			group by
			idTutoria) as t)
			where max = 6;');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantasTutoriasBuscandoSinodalesHay(){
		$query = sprintf('select
			count(*) as cuantos
			from
			((select
			idTutoria, max(idEtapa) as max
			from
			historial
			group by
			idTutoria) as t)
			where max = 4;');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function cuantasTutoriasActivasHay(){
		$query = sprintf('select
			count(*) as cuantos
			from
			((select
			idTutoria, max(idEtapa) as max
			from
			historial
			group by
			idTutoria) as t)
			where max < 4;');
		$result = $this->db ->query($query);
		$row = $result -> fetch_assoc();
		return $row['cuantos'];
	}
	
	public function tablaAsignaturasPorTemasHay(){
		$query = 
			sprintf('
				select count(distinct EstandaresDeTema.idTema) as cuantos,
					Asignaturas.nombre as asignatura
				from 
					Temas, 
					EstandaresDeTema,
					Estandares, 
					Asignaturas
				where 
					EstandaresDeTema.idTema= Temas.idTema 
				and 
					Estandares.idEstandar = EstandaresDeTema.idEstandar
				and
					Asignaturas.idAsignatura = Estandares.idAsignatura
				group by asignatura;');
		$result = $this->db->query($query);
		
		$tabla = '<table colspan="2"><th>Temas</th>';
		
		$cont = 0;
		while($row = $result -> fetch_assoc()){
			$cont += $row['cuantos'];
			$tabla .= '<tr><td class="boton" value="' . $row['asignatura'] . '">' ;
			$tabla .= $row['asignatura'] . '</td><td>';
			$tabla .= $row['cuantos'] . '</td></tr>';
		}
		
		$totalTemas = $this->cuantosTemasHay();
		
		$tabla .= '<tr><td>Sin Asignatura</td><td>' . ($totalTemas - $cont) .'</td></tr>';
		$tabla .= '<tr><td>Total</td><td>' . $totalTemas .'</td></tr>';
		$tabla .= '</table>';
		
		return $tabla;
	}
}

?>

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



    function generarMaterias() {
      const num = parseInt(document.getElementById("numMaterias").value);
      const container = document.getElementById("materiasContainer");
      container.innerHTML = "";

      if (isNaN(num) || num < 1 || num > 10) {
        container.innerHTML = "<p class='text-danger'>Ingresa un número válido entre 1 y 10.</p>";
        return;
      }

      for (let i = 1; i <= num; i++) {
        container.innerHTML += `
          <div class="col-12">
            <div class="card shadow-sm">
              <div class="card-body">
                <div class="mb-3">
                  <label class="form-label">Nombre de la materia ${i}:</label>
                  <input type="text" class="form-control" id="nombre-${i}" name="nombre-${i}" placeholder="Ej. Matemáticas" oninput="actualizarTitulo(${i})">
                </div>
                <h5 id="titulo-${i}" class="mb-3 text-primary">Materia ${i}</h5>
                <div class="row g-3">
                  <div class="col-md-6">
                    <label class="form-label">Hora de inicio</label>
                    <input type="time" class="form-control" id="inicio-${i}" name="inicio-${i}">
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Hora de fin</label>
                    <input type="time" class="form-control" id="fin-${i}" name="fin-${i}">
                  </div>
                </div>
              </div>
            </div>
          </div>
        `;
      }
    }

    function actualizarTitulo(i) {
      const nombre = document.getElementById(`nombre-${i}`).value.trim();
      const titulo = document.getElementById(`titulo-${i}`);
      titulo.textContent = nombre ? nombre : `Materia ${i}`;
    }

    function validarMaterias() {
      const docente = document.getElementById("docente").value.trim();
      const aula = document.getElementById("aula").value;
      const num = parseInt(document.getElementById("numMaterias").value);
      let mensaje = "";

      if (!docente) {
        mensaje = "Ingresa el nombre del docente.";
      } else if (!aula) {
        mensaje = "Selecciona un aula.";
      } else {
        for (let i = 1; i <= num; i++) {
          const nombre = document.getElementById(`nombre-${i}`).value.trim();
          const inicio = document.getElementById(`inicio-${i}`).value;
          const fin = document.getElementById(`fin-${i}`).value;

          if (!nombre) {
            mensaje = `Ingresa el nombre de la materia ${i}.`;
            break;
          }

          if (!inicio || !fin) {
            mensaje = `Completa los horarios de la materia "${nombre || 'Materia ' + i}".`;
            break;
          }

          if (inicio >= fin) {
            mensaje = `La materia "${nombre}" tiene un horario inválido (inicio ≥ fin).`;
            break;
          }
        }
      }

      const mensajeDiv = document.getElementById("mensajeValidacion");
      mensajeDiv.textContent = mensaje || `✅ Horarios asignados a ${docente} en ${aula}.`;
      mensajeDiv.className = mensaje ? "text-danger fw-bold" : "text-success fw-bold";
    }
 
/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



  function aplicarHorario() {
    const dias = ['lunes', 'martes', 'miércoles', 'jueves', 'viernes'];
    const inicio = document.getElementById('hora-inicio-base').value;
    const fin = document.getElementById('hora-fin-base').value;
    const contenedor = document.getElementById('campos-horarios');
    const mensaje = document.getElementById('mensaje-validacion');

    contenedor.innerHTML = '';
    mensaje.textContent = '';

    if (!inicio || !fin) {
      mensaje.textContent = '❌ Debes ingresar hora de inicio y fin';
      mensaje.style.color = 'red';
      return;
    }

    let seleccionados = [];

    dias.forEach(dia => {
      const check = document.getElementById(`check-${dia}`);
      if (check.checked) {
        seleccionados.push(dia);

        const divInicio = document.createElement('div');
        divInicio.className = 'col-md-6';
        divInicio.innerHTML = `
          <label class="form-label">${dia.charAt(0).toUpperCase() + dia.slice(1)} - Inicio</label>
          <input type="time" class="form-control" id="${dia}-inicio" value="${inicio}">
        `;

        const divFin = document.createElement('div');
        divFin.className = 'col-md-6';
        divFin.innerHTML = `
          <label class="form-label">${dia.charAt(0).toUpperCase() + dia.slice(1)} - Fin</label>
          <input type="time" class="form-control" id="${dia}-fin" value="${fin}">
        `;

        contenedor.appendChild(divInicio);
        contenedor.appendChild(divFin);
      }
    });

    if (seleccionados.length === 0) {
      mensaje.textContent = '❌ No seleccionaste ningún día';
      mensaje.style.color = 'red';
    } else {
      mensaje.textContent = `✅ Horario aplicado a: ${seleccionados.join(', ')}`;
      mensaje.style.color = 'green';
    }
  }

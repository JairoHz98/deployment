/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


   const socket = new WebSocket("ws://localhost:8080/IdconnectSE/notificacion");
        
       socket.onmessage = function(event) {
           const sms = event.data;
    mostrarAlerta(sms, 'success'); // Puedes cambiar 'success' por 'info', 'warning', 'danger'
    console.log("Mensaje recibido:", sms);

};

function mostrarAlerta(mensaje, tipo = 'info') {
    const alerta = document.createElement('div');
    alerta.className = `alert alert-${tipo} alert-dismissible fade show`;
    alerta.role = 'alert';
    alerta.innerHTML = `
        <strong>Notificacion:</strong> ${mensaje}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    `;
    document.getElementById('notificaciones').appendChild(alerta);

    // Opcional: cerrar automáticamente después de 5 segundos
    setTimeout(() => {
        alerta.classList.remove('show');
        alerta.classList.add('hide');
        alerta.remove();
    }, 5000);
}


/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



    document.addEventListener("DOMContentLoaded", function () {
      const input = document.getElementById("cardInput");

      // Evita que se envíe el formulario
      document.getElementById("cardForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Bloquea el envío
        console.log("Formulario bloqueado. Datos no enviados.");
      });

      // Opcional: mostrar los números en consola mientras se escriben
      input.addEventListener("input", function () {
        console.log("Número leído:", input.value);
      });
    });
  
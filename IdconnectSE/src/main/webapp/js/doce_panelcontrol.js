 (() => {
      const toggleBtn = document.getElementById("toggleMenuBtn");
      const menu = document.getElementById("menuIzquierdo");
      const contenido = document.getElementById("contenidoPrincipal");

      let menuVisible = false;

      toggleBtn.addEventListener("click", () => {
        menuVisible = !menuVisible;

        if (menuVisible) {
          menu.classList.add("show");
          contenido.classList.remove("col-md-12");
          contenido.classList.add("ancho-80");
          toggleBtn.classList.add("btn-rotated");
        } else {
          menu.classList.remove("show");
          contenido.classList.remove("col-md-10");
          contenido.classList.remove("ancho-80");
          contenido.classList.add("col-md-12");
          toggleBtn.classList.remove("btn-rotated");
        }
      });
    })();
    
    
     
    
  
    



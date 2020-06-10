// Enable links to change color on hover
const link_color = document.querySelectorAll('.link-effect');

for (let i = 0; i < link_color.length; i++ ){
    link_color[i].addEventListener('mouseover', (e) => {
        link_color[i].style.color = 'white';
    });
    link_color[i].addEventListener('mouseout', (e) => {
        link_color[i].style.color = '';
    });
}

// Enable subsection titles to change color on hover
const title_color = document.querySelectorAll('.subsection-title-description');
const button_color = document.querySelectorAll('.subsection-button');

for (let i = 0; i < title_color.length; i++ ){
  button_color[i].addEventListener('mouseover', (e) => {
    button_color[i].style.color = '#DEC79B';
    });
    button_color[i].addEventListener('mouseout', (e) => {
      button_color[i].style.color = '';
    });
}

//Enables subsections to expand and close
function section_text_toggle(elem) {

  const subsection = document.getElementById(elem.parentNode.parentNode.id);
  
  let text = subsection.children[1];
  let button = subsection.children[0].children[0];

  if (text.style.display === "block"){
    text.style.display = "none";
    button.textContent = "▼";
    button.title = "Expand";
  } 
  else{
    text.style.display = "block";
    button.textContent = "▲";
    button.title = "Close";

  }
}
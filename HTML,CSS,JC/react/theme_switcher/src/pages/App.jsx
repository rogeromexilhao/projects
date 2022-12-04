import sol from '../../src/images/assets/sun.svg'
import lua from '../../src/images/assets/moon.svg'
import React, { useState, useEffect} from "react";
import './style.css'

export function App() {
  /* 
  <label class="switch" for='darkmode'>
    <input type="checkbox" id='darkmode' class='darkmode'/>
    <span class="slider round"></span>
  </label>
   
  
  const [toggle,setToggle] = useState('')
  const toggle = document.getElementById('toggle');
  toggle.onclick = function(){
    toggle.classList.toggle('active')
  };

  <i onClick={handleCheck} className="indicator"></i>
  */
  const [isChecked,setChecked] = useState(false)
  
  console.log('isChecked',isChecked)

  //const handleCheck = () => {
    //setChecked((prevstate) => !prevstate)
  //}
  //{isChecked? white: black}

  return (
    <body className={isChecked ? 'background-black':'background-white'}>
      <h1>{isChecked ? 'Dark' : 'Light'}</h1>
      
      <label className='toggle'>
        <input type='checkbox' onClick={() => setChecked(!isChecked)}/>
        <span />
      </label>    
    </body>
  )
}


import './style.css'
import { useState } from 'react'
import { defineConfig } from 'vite';
export {defineConfig} 

export default function App() {
  const SerialPort = require('serialport');
  const parsers = SerialPort.parsers;

  var requirejs = require('requirejs')

  console.log(parser)

  const parser = new parsers.Readline({
    delimiter: '\r\n'
  });

  const port = new SerialPort('COM5', {
    baudRate: 9600
  });
  
  port.pipe(parser);

  port.on('open', () => console.log('Port open'));

  function sendToLoopback(data) {
    var request = require('request');
    if(data){        
        request.post(
            'http://localhost:3000/api/sender',
            { json: { corrente: data } },
            function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    console.log('Sender to loopback =>', body)
                }
            }
        );        
    } else {
        console.log('No datas !');
    }
  }

  // parser.on('data', console.log);
  parser.on('data', function(data){
      console.log('main.js => retorno =>', data);
      sendToLoopback(data);
  });

  return (
    <div className="main">
      <h1 className='dados'></h1>
    </div>
  )
}

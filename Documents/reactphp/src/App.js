//import logo from './logo.svg';
import './Style.css';
import { Routes, Route } from 'react-router-dom';
import Header from './Componets/Header';
import Home from './Componets/Home';
import Userlist from './Componets/Userlist';
import Adduser from './Componets/Adduser';
import Footer from './Footer';

function App() {
  return (
    <div className="App">

      <Header/>

      <Routes>
         <Route path="/" element= {<Home/>} />
         <Route path="/userlist" element= {<Userlist/>} />
         <Route path="/adduser" element= {<Adduser/>} />
      </Routes>

      <Footer/>
    </div>
  );
}

export default App;

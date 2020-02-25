import React from 'react'
import './css/App.css'
import LeftMenu from '@/components/LeftMenu'
import RightMenu from './components/RightMenu'
import Style from '@/sass/App.scss'
import { BrowserRouter as Router } from 'react-router-dom'


function App(props) {
  return (
    <div className={Style.App}>
      <Router>
        <LeftMenu /> <RightMenu />
      </Router>
    </div>);
}

export default App;
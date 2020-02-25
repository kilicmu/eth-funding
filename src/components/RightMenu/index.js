import React from 'react'
import Product from '@/components/Product'
import Style from '@/sass/RightMenu.scss'
import ProductList from '@/components/ProductList'
import Community from '@/components/Community'
import { Route, Switch } from 'react-router-dom'


export default function RightMenu(props) {
  return (
    <div className={Style.outside}>
      <Switch>
        <Route exact path="/"><ProductList /></Route>
        <Route path="/community"><Community /></Route>
      </Switch>
    </div >)
}
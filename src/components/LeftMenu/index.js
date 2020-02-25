import React, { useState } from 'react'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import { Menu, Icon } from 'antd'
import Style from '@/sass/LeftMenu.scss'

const { SubMenu } = Menu;

export default function LeftMenu() {

  const [collapsed, setCollapsed] = useState(false)
  return (<>
    <Menu
      defaultSelectedKeys={['1']}
      defaultOpenKeys={['sub1']}
      mode="inline" theme="dark"
      inlineCollapsed={collapsed}
      className={
        Style.left_menu
      }>
      <SubMenu
        key="sub1"
        title={<span> <Icon type="mail" /> <span>众筹</span> </span>}
      >
        <Menu.Item key="5"><Link to="/">产品众筹</Link></Menu.Item>
        <Menu.Item key="6"><Link to="/community">众筹社区</Link></Menu.Item>
        <Menu.Item key="7"><Link to="/signup">发起众筹</Link></Menu.Item>
        <Menu.Item key="8"><Link to="/mine">我的众筹</Link></Menu.Item>
      </SubMenu>

    </Menu>
  </>
  )
}
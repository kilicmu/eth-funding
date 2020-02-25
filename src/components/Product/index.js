import React from 'react'
import { Card, Progress } from 'antd'
import Style from '@/sass/Product.scss'
const { Meta } = Card

export default function Product(props) {
  return (
    <a href={props.to} className={Style.outline}>
      <Card
        hoverable
        style={{ width: 240, height: 450 }}
        cover={<img alt={props.alt} src={props.pic} />}
      >
        <Meta title={props.title} description={props.description} style={{ height: 0 }} />
        <Progress percent={30} size="small" className={Style.progress} />
      </Card>
    </a>
  )
}  
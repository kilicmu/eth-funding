import React from 'react';
import Product from '@/components/Product';
import Style from '@/sass/ProductList.scss';

export default function ProductList(props) {

  return (
    <div className={Style.outline}>
      <Product
        className={Style.product}
        to="https://baidu.com"
        alt="example"
        pic="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
        title="Europe Street beat"
        description="example"
      />
      <Product
        className={Style.product}
        to="https://baidu.com"
        alt="example"
        pic="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
        title="Europe Street beat"
        description="example"
      />
      <Product
        className={Style.product}
        to="https://baidu.com"
        alt="example"
        pic="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
        title="Europe Street beat"
        description="example"
      />
      <Product
        className={Style.product}
        to="https://baidu.com"
        alt="example"
        pic="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
        title="Europe Street beat"
        description="example"
      />
      <Product
        className={Style.product}
        to="https://baidu.com"
        alt="example"
        pic="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
        title="Europe Street beat"
        description="example"
      />
      <Product
        className={Style.product}
        to="https://baidu.com"
        alt="example"
        pic="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
        title="Europe Street beat"
        description="example"
      />
    </div>
  )
}
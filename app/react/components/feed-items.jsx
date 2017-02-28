import React from 'react';
import { Button, Icon, Row, Col, Tag } from 'antd';
import moment from 'moment';
import { Link } from 'react-router'

class FeedItems extends React.Component {
  render () {
    const items = this.props.items;
    return (    
      <div>
        {items.map((item, i) =>
          <Row className="ca-item" key={i}>
            <Col span={2}>
              <Tag>
                <Link className="ca-item-type" to={`/${item.item_type}s`}>{item.item_type && item.item_type.replace(/_/g, " ")}</Link>
              </Tag>
            </Col>
            <Col span={10}>
              <Link className="ca-item-title" to={`/items/${item.id}`}><b>{item.title}</b></Link>
            </Col>
            <Col span={4}>
              <span className="ca-item-time">
                {moment(item.created_at).fromNow()}
              </span>
            </Col>
            <Col span={8}>
              <Icon onClick={this.props.deleteItem.bind(this, item)} className="ca-item-delete" type="close-circle" />
            </Col>
          </Row>
        )}
      </div>
    )
  }
}

FeedItems.propTypes = {
  items: React.PropTypes.object.isRequired,
  deleteItem: React.PropTypes.func.isRequired,
};

export default FeedItems;
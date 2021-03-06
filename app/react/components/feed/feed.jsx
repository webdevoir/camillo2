import 'antd/dist/antd.css';
import React from 'react';
import { Layout, Icon, Row, Col } from 'antd';
const { Header, Content } = Layout;
import { Link, browserHistory } from 'react-router';
import { observer, inject } from 'mobx-react';
import FeedNav from './feed-nav';
import FeedItems from './feed-items';
require("./feed.css.scss")


@inject(["FeedStore"]) @observer
class Feed extends React.Component {
  constructor(props) {
    super(props)
  }
  
  componentWillMount() {
    console.log("feed mount", this.props);
    const itemPath = this.props.params.type ? this.props.params.type : "items";
    this.props.FeedStore.getItems(itemPath);
  }
  
  componentWillReceiveProps(nextProps) {
    if (this.props != nextProps) {
      this.props.FeedStore.getItems(nextProps.params.type);
    }
  }
  
  render () {
    const items = this.props.FeedStore.items;
    // const leftOffset = 7;
    return (
      <Layout className="ca-feed">
        <Content>
          <Row gutter={50}>
            <Col span={7}>
              <FeedNav className="ca-nav-vert" />
            </Col>
            <Col span={10}>
              <div className="ca-feed">
                <FeedItems items={items} />
              </div>
            </Col>
          </Row>
          <Row>

          </Row>
        </Content>
      </Layout>
    )
  } 
}

export default Feed;
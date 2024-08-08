<template>  
    <div>  
      <nav>  
        <ul>  
          <li v-for="item in menuItems" :key="item.id">  
            <a :href="item.link">{{ item.title }}</a>  
            <ul v-if="item.subItems">  
              <li v-for="subItem in item.subItems" :key="subItem.id">  
                <a :href="subItem.link">{{ subItem.title }}</a>  
              </li>  
            </ul>  
          </li>  
        </ul>  
      </nav>  
    </div>
    <div>
      <button @click="greet">调用rsut</button>
      <textarea v-model="greetMsg"></textarea>
    </div>  
  </template>  
    
  <script>  
  import { invoke } from '@tauri-apps/api'
  export default {  
    name: 'MenuBar',
    methods:{
     greet() { 
      console.log("ddddd!") 
      invoke('greet', {name:this.greetMsg})  
      .then((response) =>{ 
        console.log(response)
        this.greetMsg = response
      })  
     .catch(console.error)

      }  
    },
    data() {  
      return {  
        greetMsg:'tauri',
        menuItems: [  
          {  
            id: 1,  
            title: '首页',  
            link: '/'  
          },  
          {  
            id: 2,  
            title: 'chanping1',  
            link: '/products',  
            subItems: [  
              {  
                id: 21,  
                title: '产品 A',  
                link: '/products/a'  
              },  
              {  
                id: 22,  
                title: '产品 B',  
                link: '/products/b'  
              }  
            ]  
          },  
          {  
            id: 3,  
            title: '关于我们',  
            link: '/about'  
          },  
          {  
            id: 4,  
            title: '联系我们',  
            link: '/contact'  
          }  
        ]  
      }  
    }  
  }
  
  
  </script>  
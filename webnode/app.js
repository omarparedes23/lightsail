import express from "express";
const app=express();
const port=8000;
app.get( '/', (req,res)=> {
res.send('welcome todos 8000');
}
);
app.listen( port, ()=> {
console.log('server running port 8000');
}
);

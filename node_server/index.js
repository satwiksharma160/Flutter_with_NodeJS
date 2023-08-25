const express = require("express");
const mongoose = require("mongoose");
const app = express();
const Product = require("./product");
app.use(express.json());

app.use(express.urlencoded(
    {extended: true}
));

const productData = [];

//connect to mongoose

const connectToMongo = async () => {
    try {
        mongoose.connect(MongoDB_Cluster_path, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log("Status: Connected to MongoDB");

        app.post("/api/add_product", async(req, res) => {

            console.log("Result", req.body);

            let data = Product(req.body);
            
            try {
                let dataToStore = data.save();
                res.status(200).json(dataToStore);
            } catch (error) {
                res.status(400).json({
                    'status': error.message
                })
                
            }
        
            // const pdata = {
            //     "id": productData.length+1,
            //     "pname": req.body.pname,
            //     "pprice": req.body.pprice,
            //     "pdesc": req.body.pdesc
            // };
        
            // productData.push(pdata);
            // console.log("Final", pdata);
        
            // res.status(200).send({
            //     "status_code": 200,
            //     "message": "Product added successfully",
            //     "product": pdata
            // });
        
        
        })
        
        
        app.get("/api/get_product", async(req, res) =>{
        
            if(productData.length > 0){
                res.status(200).send({
                    'status_code': 200,
                    'products': productData
                });
            }else{
                res.status(200).send({
                    'status_code': 200,
                    'products': []
                });
            }
        
        
        
        
        })
        
        //update api put
        
        app.put("/api/update/:id", async(req, res) => {
        
            let id = req.params.id *1;
            let productToUpdate = productData.find(p => p.id === id);
            let index = productData.indexOf(productToUpdate);
        
            productData[index] = req.body;
        
            res.status(200).send({
                'status': "success",
                'message': "Product updated successfully",
            })
        
        })
        
        app.delete("/api/delete/:id", async(req, res) => {
        
            let id = req.params.id *1;
            let productToUpdate = productData.find(p => p.id === id);
            let index = productData.indexOf(productToUpdate);
        
            productData.splice(index, 1);
        
            res.status(204).send({
                'status': "success",
                'message': "Product deleted successfully",
            })
        
        })


    } catch (error) {
        console.error("Error connecting to MongoDB:", error);
    }
};

connectToMongo();

app.listen(2000, () => {
    console.log("Server running on port 2000");
})




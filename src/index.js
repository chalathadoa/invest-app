const express = require('express');
const dotenv = require('dotenv');
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const cors = require('cors');
const app = express();

dotenv.config();

const PORT = process.env.PORT;

function generateNoTransaction() {
    const timestamp = new Date().toISOString().replace(/[-:.T]/g, '').substring(2, 14);
    const randomSuffix = Math.floor(Math.random() * 10000).toString().padStart(3, '0');
    return `TRX${timestamp}${randomSuffix}`;
}

app.use(express.json());
app.use(cors({
    origin: 'http://localhost:3000',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    credentials: true
}));
// app.use(express.static(path.join(__dirname, 'public/dist')));

// app.get('*', (req, res) => {
//     res.sendFile(path.join(__dirname, 'public/dist/index.html'));
// });

app.post('/investasi', async (req, res) => {
    const { 
        jenis_kelamin, 
        usia,
        nominal, 
        lama_investasi 
    } = req.body;
    let { perokok } = req.body;

    let bunga_tahunan = 0;
    perokok = perokok === "Ya" ? true : false;

    if (jenis_kelamin === 'Pria') {
        bunga_tahunan = perokok ? 0.01 : 0.02;
    } else if (jenis_kelamin === 'Wanita') {
        bunga_tahunan = perokok ? 0.02 : 0.03;
    }

    if (usia <= 30) {
        bunga_tahunan += 0.01;
    } else if (usia <= 50) {
        bunga_tahunan += 0.005;
    }

    let hasil_investasi = {};
    let awal = nominal;

    for (let i = 1; i <= lama_investasi; i++) {
        let bunga = awal * bunga_tahunan;
        let akhir = awal + bunga;
        
        hasil_investasi[i] = {
            awal: awal,
            bunga: bunga,
            akhir: akhir
        };
    
        awal = akhir;
    }

    // const investasi = await prisma.invest.create({
    //     data: {
    //         jenis_kelamin,
    //         usia,
    //         perokok,
    //         nominal,
    //         lama_investasi,
    //         hasil_investasi
    //     }
    // });

    res.json({
        message: "Success",
        status: 200,
        data: hasil_investasi
    });
});

app.post('/payment', async (req, res)=> {
    const {
        nama,
        jenis_kelamin,
        usia,
        email,
        nominal,
        lama_investasi,
        periode_pembayaran,
        metode_bayar
    } = req.body;
    
    let { perokok } = req.body;
    perokok = perokok === "Ya" ? true : false;
    const no_transaction = generateNoTransaction();

    let total_bayar;
    const nominalPerBulan = nominal / 12;
    
    if (periode_pembayaran === "Tahunan") {
        total_bayar = nominalPerBulan * 11;
    } else if (periode_pembayaran === "Bulanan") {
        total_bayar = nominal;
    }

    // const transaction = await prisma.transaction.create({
    //     data: {
    //         tgl_transaksi: new Date(),
    //         no_transaction: generateNoTransaction(),
    //         nama: Nama,
    //         email,
    //         jenis_kelamin,
    //         usia,
    //         perokok,
    //         nominal,
    //         lama_investasi,
    //         periode_pembayaran,
    //         metode_bayar,
    //         total_bayar
    //     }
    // });

    const response = {
        message: 'Success',
        status: 200,
        data: {
            tgl_transaksi: new Date().toISOString(),
            no_transaction: generateNoTransaction(),
            nama: nama,
            jenis_kelamin: jenis_kelamin,
            usia: usia,
            email: email,
            nominal: nominal,
            lama_investasi: lama_investasi,
            periode_pembayaran: periode_pembayaran,
            metode_bayar: metode_bayar,
            total_bayar: total_bayar,
        }
    }; 
    res.json({
        response
    });
});

app.listen(PORT, ()=>{
    console.log("Express API running in port:" + PORT);
});
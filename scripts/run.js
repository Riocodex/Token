const main = async()=>{
    //0x36526bF9891b01BdE92F5Fa7C4AB4fd26fdAE8B3
    
    try{
        const nosDogFactory = await hre.ethers.getContractFactory("Nosdog")
        const nosDog = await nosDogFactory.deploy()
        await nosDog.deployed()
        console.log("contract deployed to: ",nosDog.address)
        process.exit(0)
    }catch(error){
        console.log(error)
        process.exit(1)
    }
}

main()
const main = async()=>{
    try{
        const nosDogFactory = await hre.ethers.getContractFactory("Nosdog")
        const nosDog = await nosDogFactory.deploy(100)
        await nosDog.deployed()
        console.log("contract deployed to: ",nosDog.address)
        process.exit(0)
    }catch(error){
        console.log(error)
        process.exit(1)
    }
}

main()
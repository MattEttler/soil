config = require('./config.json')

const {
    login
} = require("tplink-cloud-api");

const exec = require('child_process').exec;

login(config.username, config.password)
    .then((response) => {
        let tplink = response;
        tplink.getDeviceList().then(() => {
            let flash = tplink.getHS110("observer-1-flash");
            let growLight = tplink.getHS110("observer-1-grow");
            growLight.powerOff().then(() => {
                flash.powerOn().then(() => {
                    const result = exec('sh /home/matt/bell-boy/controller.sh', (error, stdout, stderr) => {});
                    result.on('close', () => {
                        flash.powerOff();
                        growLight.powerOn();
                    });
                });
            })
        })
    },
        reason => console.log(reason));

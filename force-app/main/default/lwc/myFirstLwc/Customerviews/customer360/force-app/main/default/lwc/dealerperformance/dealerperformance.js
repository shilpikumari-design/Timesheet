import { LightningElement } from 'lwc';

export default class DealerPerformance extends LightningElement {

    forecastQty = 1000;
    actualQty = 750;

    get achievement() {
        if (this.forecastQty === 0) {
            return 0;
        }
        return ((this.actualQty / this.forecastQty) * 100).toFixed(2);
    }
}
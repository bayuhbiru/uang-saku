export default {
    data() {
        return {
            balance: 0,
            message: "Selamat datang di dompet ICP!",
        };
    },
    async mounted() {
        this.balance = await this.getBalance();
    },
    methods: {
        async getBalance() {
            const response = await fetch("https://<backend-url>/getBalance");
            const balance = await response.json();
            return balance;
        },
    },
    template: `
        <div>
            <h1>{{ message }}</h1>
            <p>Saldo Anda: {{ balance }} ICP</p>
        </div>
    `,
};

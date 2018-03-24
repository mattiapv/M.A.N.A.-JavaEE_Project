package db;

import java.io.Serializable;

/**
 * Created on: 25-ago-2017
 */
public class OrderProducts implements Serializable{
    
    private int idSeller;
    private int orderStatus;
    private boolean buyerRead;
    private boolean sellerRead;
    private boolean adminRead;
    private String problemDescription;
    private Product prodotto;
    
    public int getIdSeller() {
        return idSeller;
    }

    public void setIdSeller(int idSeller) {
        this.idSeller = idSeller;
    }

    public String getOrderStatus() {
        switch (this.orderStatus) {
            case 1:
                return "Rimborsato";
            case 2:
                return "Segnalazione negativa";
            case 3:
                return "Rigettato";
            case 5:
                return "Pagamento Ricevuto";
            case 6:
                return "Ordine in Preparazione";
            case 7:
                return "Ordine Spedito";
            case 8:
                return "Ordine Completo";
            case 9:
                return "Anomalia Segnalata al Negozio e all'amministratore";
            default:
                return "Nessuna informazione";
        }
    }
    
    public int getOrderStatusNumber() {
        switch (this.orderStatus) {
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            case 5:
                return 5;
            case 6:
                return 6;
            case 7:
                return 7;
            case 8:
                return 8;
            case 9:
                return 9;
            default:
                return 0;
        }
    }
    
    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public boolean isBuyerRead() {
        return buyerRead;
    }

    public void setBuyerRead(boolean buyerRead) {
        this.buyerRead = buyerRead;
    }

    public boolean isSellerRead() {
        return sellerRead;
    }

    public void setSellerRead(boolean sellerRead) {
        this.sellerRead = sellerRead;
    }

    public boolean getAdminRead() {
        return adminRead;
    }

    public void setAdminRead(boolean adminRead) {
        this.adminRead = adminRead;
    }

    public String getProblemDescription() {
        return problemDescription;
    }

    public void setProblemDescription(String problemDescription) {
        this.problemDescription = problemDescription;
    }

    public Product getProdotto() {
        return prodotto;
    }

    public void setProdotto(Product prodotto) {
        this.prodotto = prodotto;
    }

}

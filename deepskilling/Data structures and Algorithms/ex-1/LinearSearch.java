class LinearSearch {

    static Product search(Product[] products, int targetId) {
        for (Product p : products) {
            if (p.productId == targetId) {
                return p;
            }
        }
        return null;
    }
}
	
public class ClasseProduit {

	private String classe;
	private String nom;
	private boolean taxable;
	
	/**
	 * @param classe
	 * @param nom
	 * @param taxable
	 */
	public ClasseProduit(String classe, String nom, boolean taxable){
		this.classe = classe;
		this.nom = nom;
		this.taxable = taxable;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ClasseProduit [classe=" + classe + ", nom=" + nom
				+ ", taxable=" + taxable + "]";
	}
	
	
}

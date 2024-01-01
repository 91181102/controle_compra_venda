namespace Recicla.Data 
{
    public class Usuario
    {
        #region: Membros da classe
        /// <summary>
        /// Obtém ou define o ID da tabela.
        /// </summary>
        public int id { get; set; }
        /// <summary>
        /// Obtém ou define o nome do usuário.
        /// </summary>
        public string nome { get; set; }
        /// <summary>
        /// Obtém ou define o email do usuário.
        /// </summary>
        public string email { get; set; }
        /// <summary>
        /// Obtém ou define a senha do usuário.
        /// </summary>
        public string senha { get; set; }
        /// <summary>
        /// Obtém ou define o tipo de usuário. 0: usuario, 1: administrador.
        /// </summary>
        public int tipo { get; set; }
        /// <summary>
        /// Obtém ou define se o cadastro está ativo.
        /// </summary>
        public bool ativo { get; set; }
        #endregion
    }
}

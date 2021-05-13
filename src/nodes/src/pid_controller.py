class PID:
    """
    PID Constructor
    min: float
    max: float
    k_p: float
    k_i: float
    k_d: float
    """
    def __init__(self, min_limit, max_limit, k_p, k_i=0, k_d=0):
        # lower and upper limits on PID output
        self.min_limit = min_limit
        self.max_limit = max_limit

        # PID constants
        self.k_p = k_p
        self.k_i = k_i
        self.k_d = k_d

    """
    ===== ONLY P CURRENTLY IMPLEMENTED =====
    Get the next PID output
    error: float
    """
    def next(self, error):
        # calculate each term
        p_term = self.k_p * error
        i_term = 0
        d_term = 0

        # combine terms, fit within min/max range, and make sure result is 
        # within limits
        combined_term = p_term + i_term + d_term
        combined_term *= (self.max_limit - self.min_limit)
        combined_term += ((self.max_limit + self.min_limit) / 2)
        combined_term = max(combined_term, self.min_limit)
        combined_term = min(combined_term, self.max_limit)

        return combined_term
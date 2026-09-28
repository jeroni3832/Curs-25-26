package remove_parameters_assingnments10;

public class Student {
    public float evaluateTerm(float homeworkMark, float examMark, float attitude) {
       float finalMark = 0;

       finalMark = examMark;

        if (examMark < 5) {
            finalMark = 1;
        }

        if (homeworkMark < 4) {
            finalMark += 1;
        }else{
            finalMark += homeworkMark;
        }
        return (finalMark + examMark) / 2 + attitude;
    }
}

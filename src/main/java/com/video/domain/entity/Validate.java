package com.video.domain.entity;

public class Validate {
    private String infoId;

    private String infoAnswer;

    private String infoQuestion;

    private String infoState;

    public String getInfoId() {
        return infoId;
    }

    public void setInfoId(String infoId) {
        this.infoId = infoId == null ? null : infoId.trim();
    }

    public String getInfoAnswer() {
        return infoAnswer;
    }

    public void setInfoAnswer(String infoAnswer) {
        this.infoAnswer = infoAnswer == null ? null : infoAnswer.trim();
    }

    public String getInfoQuestion() {
        return infoQuestion;
    }

    public void setInfoQuestion(String infoQuestion) {
        this.infoQuestion = infoQuestion == null ? null : infoQuestion.trim();
    }

    public String getInfoState() {
        return infoState;
    }

    public void setInfoState(String infoState) {
        this.infoState = infoState == null ? null : infoState.trim();
    }
}
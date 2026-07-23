import styles from "./CohortDetails.module.css";

function CohortDetails(props) {

    const headingStyle = {
        color:
            props.cohort.currentStatus.toLowerCase() === "ongoing"
                ? "#28a745"
                : "#007bff"
    };

    return (
        <div className={styles.box}>

            <h3 style={headingStyle}>
                {props.cohort.cohortCode}
                <br />
                {props.cohort.technology}
            </h3>

            <dl>
                <dt>Started On</dt>
                <dd>{props.cohort.startDate}</dd>

                <dt>Status</dt>
                <dd>{props.cohort.currentStatus}</dd>

                <dt>Coach</dt>
                <dd>{props.cohort.coachName}</dd>

                <dt>Trainer</dt>
                <dd>{props.cohort.trainerName}</dd>
            </dl>

        </div>
    );
}

export default CohortDetails;